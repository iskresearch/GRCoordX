import subprocess
from pathlib import Path
import json
import argparse
import time
import sys
import os
from typing import Optional, Dict, Any

DEFAULT_CONFIG = {
    "model_path": "~/llama3",
    "llama_run_bin": "~/Documents/source-codes/llama.cpp/build/bin/llama-run",
    "output_dir": "./automations/metric-jsons",
    "tokens": 512,
    "max_new_tokens": 512,
    "timeout": 500,
    "verbose": True
}


class ChatBot:
    def __init__(self, config: Dict[str, Any]):
        self.model_path = Path(os.path.expanduser(config["model_path"]))
        self.llama_run_bin = os.path.expanduser(config["llama_run_bin"])
        self.output_dir = Path(os.path.expanduser(config["output_dir"]))
        self.tokens = config["tokens"]
        self.max_new_tokens = config["max_new_tokens"]
        self.timeout = config["timeout"]
        self.verbose = config["verbose"]

        self.output_dir.mkdir(parents=True, exist_ok=True)

    def run_model(self, prompt: str) -> str:
        if self.verbose:
            print(f"[•] Running model with prompt length: {len(prompt)}")

        try:
            cmd = [
                self.llama_run_bin,
                "-t", str(self.tokens),
                "-n", str(self.max_new_tokens),
                "-v" if self.verbose else "",
                str(self.model_path),
                prompt
            ]
            cmd = [arg for arg in cmd if arg]  # Remove empty args

            start_time = time.time()
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=self.timeout
            )

            elapsed_time = time.time() - start_time
            if self.verbose:
                print(f"[•] Model took {elapsed_time:.2f} seconds to respond")

            return result.stdout
        except subprocess.TimeoutExpired:
            return "ERROR: Timeout - the model took too long to respond"
        except Exception as e:
            return f"ERROR: {str(e)}"

    def extract_json(self, text: str) -> Optional[Dict[str, Any]]:
        try:
            start = text.index('{')
            end = text.rindex('}') + 1
            return json.loads(text[start:end])
        except (ValueError, json.JSONDecodeError) as e:
            if self.verbose:
                print(f"[!] JSON extraction failed: {e}")
            return None

    def process_text_file(self, file_path: Path) -> Dict[str, Any]:
        if not file_path.exists():
            return {"error": f"File not found: {file_path}"}

        message = file_path.read_text().strip()

        if self.verbose:
            print(f"[•] Processing message from {file_path.name}")

        # Build one-shot prompt — no history
        prompt = f"User: {message}\n\nAssistant: "

        response = self.run_model(prompt)

        json_response = self.extract_json(response)

        if json_response:
            return json_response
        else:
            return {"message": response}


def process_directory(input_dir: str, config: dict):
    chat_bot = ChatBot(config)

    output_dir = Path(os.path.expanduser(config["output_dir"]))
    output_dir.mkdir(parents=True, exist_ok=True)

    input_path = Path(os.path.expanduser(input_dir))
    if not input_path.exists() or not input_path.is_dir():
        print(f"Error: Directory '{input_dir}' does not exist or is not a directory")
        sys.exit(1)

    text_files = sorted(input_path.glob("*.txt"))

    if not text_files:
        print(f"No .txt files found in '{input_dir}'")
        sys.exit(0)

    print(f"Found {len(text_files)} text files to process")

    for i, file_path in enumerate(text_files, 1):
        print(f"[{i}/{len(text_files)}] Processing {file_path.name}...")

        result = chat_bot.process_text_file(file_path)

        output_file = output_dir / f"{file_path.stem}_result.json"
        with open(output_file, "w") as f:
            json.dump(result, f, indent=2)

        print(f"  ✓ Result saved to {output_file}")



def main():
    parser = argparse.ArgumentParser(description="Process all text files in a directory using ChatBot")
    parser.add_argument("input_dir", help="Directory containing text files to process")
    parser.add_argument("--model-path", help=f"Path to the model (default: {DEFAULT_CONFIG['model_path']})")
    parser.add_argument("--llama-run-bin",
                        help=f"Path to llama-run binary (default: {DEFAULT_CONFIG['llama_run_bin']})")
    parser.add_argument("--output-dir", help=f"Directory to save results (default: {DEFAULT_CONFIG['output_dir']})")
    parser.add_argument("--tokens", type=int, help=f"Number of tokens (default: {DEFAULT_CONFIG['tokens']})")
    parser.add_argument("--max-new-tokens", type=int,
                        help=f"Maximum new tokens (default: {DEFAULT_CONFIG['max_new_tokens']})")
    parser.add_argument("--timeout", type=int, help=f"Timeout in seconds (default: {DEFAULT_CONFIG['timeout']})")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")

    args = parser.parse_args()

    config = DEFAULT_CONFIG.copy()
    for key, value in vars(args).items():
        if key != "input_dir" and value is not None:
            config_key = key.replace("-", "_")
            config[config_key] = value

    process_directory(args.input_dir, config)


if __name__ == "__main__":
    main()
