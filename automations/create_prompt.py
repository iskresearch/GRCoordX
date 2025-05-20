import json
import os
import requests
import argparse
from typing import List, Dict, Any, Optional


def create_prompt(chart_name: str) -> str:
    """
    Create a well-structured prompt for the LLM to generate JSON data for a spacetime metric.

    Args:
        metric_name: The name of the spacetime metric

    Returns:
        A formatted prompt string
    """
    prompt = f"""Generate a structured JSON for the chart known as {chart_name}.

The response should be ONLY a valid JSON with the following structure:
{{
	"name": "Name of the Chart",
	"abbrev":  "Abbreviation Used in Mathematica or MathSage e.g. Cart for cartesian",
	"description": "Brief description of the chart",
	
	"dimension": 4,
	"symbols": ["t","r","\\[Theta]", "\\[Phi]"],
	
	"transformations": ["what this coordinate can transform to? just camelCase name", "e.g toSpherical],
	"considerations" : ["list of considerations, for example limits of variables, or transformation considerations"]
}}


Important rules:
1. Output ONLY the JSON with no additional explanatory text or commentary
2. Ensure the JSON is valid and properly formatted
3. Use null for unknown values
4. Symbols should be written either as english characters or like \\[GreekLetterNameWithCapitalizationOfTheFirstLetter].
"""

    return prompt


if __name__ == "__main__":
    # Getting all the metrics
    with open("./automations/charts.init") as f:
        metrics = f.readlines()
    index = 1
    # Saving a prompt file for each metric.
    for metric in metrics:
        metric = metric.split(".")[1].split("\n")[0].strip()

        prompt = create_prompt(metric)
        if index < 10:
            completeIndex = f"0{index}"
        else:
            completeIndex = f"{index}"
        print(metric)
        # saving the file
        with open(f"/mnt/second/Projects/Active/einstein-atlas/automations/chart_prompts/{completeIndex}-{metric}.txt", "w") as f:
            f.write(prompt)
        index += 1