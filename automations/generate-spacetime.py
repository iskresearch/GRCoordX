import json
import os
import requests
import argparse
from typing import List, Dict, Any, Optional


def create_prompt(metric_name: str) -> str:
    """
    Create a well-structured prompt for the LLM to generate JSON data for a spacetime metric.

    Args:
        metric_name: The name of the spacetime metric

    Returns:
        A formatted prompt string
    """
    prompt = f"""Generate a structured JSON for the spacetime metric known as {metric_name}.

The response should be ONLY a valid JSON with the following structure:
{{
    "name": "The full formal name of the {metric_name} metric",
    "abbrev": "The standard abbreviation used in Mathematica or MathSage",
    "description": "A brief, clear description of this spacetime, including its physical significance",

    "defined": "true if this spacetime metric is defined",
    "derived": "true if this spacetime metric is derivable from something else",
    "signature": "signature of the metric, -1 is the default for all unless a metric uses something specific",
    "dimensions": "number of dimensions of the manifold",

    "charts": [
        {{
            "chartName": "The standard coordinate chart name for {metric_name}",
            "xlineElement": "The line element (ds²) in Mathematica InputForm notation",
            "validated": null,
            "constantSymbols": ["List", "of", "constant", "symbols", "used", "in", "the", "metric"]
        }}
    ],
    "desiredProperties": ["christoffels", "ricci", "riemann", "einstein", "weyl", "g00", "infiniteRedShift", "horizons", "singularities", "limits"],
    "diagrams": []
}}

Important rules:
1. Output ONLY the JSON with no additional explanatory text or commentary
2. Ensure the JSON is valid and properly formatted
3. Use null for unknown values
4. For xlineElement, provide the precise mathematical expression in Mathematica InputForm. The most important part is to WRITING THE LINE ELEMENT.
5. Include all relevant constant symbols (e.g. mass, charge, angular momentum parameters)
6. Ensure the "name" field contains the full formal name
7. The "abbrev" field should contain standard variable name to used in mathematical software
8. For "description", provide a concise yet informative explanation
"""

    return prompt


if __name__ == "__main__":
    # Getting all the metrics
    with open("metrics.init") as f:
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

        # saving the file
        with open(f"/mnt/second/Projects/Active/einstein-atlas/automations/prompts/{completeIndex}-{metric}.txt", "w") as f:
            f.write(prompt)
        index += 1