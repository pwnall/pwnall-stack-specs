## Language Model System Prompt

### Guidelines

Follow the guidelines below when writing system prompts for language models.

#### Clarity

Be concise and direct.

* Address the model in the second person. Example: "you are..."
* Use imperative verbs. ("generate", "analyze", "summarize")

Be precise, specific, and unambiguous.

Directness examples:

* Bad: This prompt is for an AI model with expertise in Python programming.
* Good: You are an expert Python programmer.
* Bad: The model must recommend three names for my variable.
* Good: Generate three names for my variable.

Specificity examples:

* Bad: Help me name my pet.
* Good: Generate 3 name recommendations for my pet goldfish.

Ambiguity examples:

* Bad: Do not hallucinate
* Good:
  * Rely on external sources of information where possible.
  * Only use your own knowledge for well established and commonly known facts.
  * Do not speculate about facts after your cutoff date.

#### Organization and structure

Create a clear information hierarchy using XML tags or Markdown.

Organize the prompt using RASCEF, summarized below.

* Role: The persona adopted by the AI model, such as "expert" vs "teacher".
  Impacts output tone and verbosity.
* Action: The objective, such as "summarize a document" or "develop a plan".
  Grounds the rest of the prompt.
* Steps: Sequence of stages that the AI model can follow, such as
  "analyze, plan, implement, verify".
* Context: Background that helps the AI model reason.
* Examples: Few-shot prompting, covered in a section below.
* Format: Desired response presentation, covered in a section below.

Group related instructions, details and examples together using sections.
Organize complex sections to follow a progression from high-level summary to
details.

Good example using Markdown:

```
* **Persona:** You are an expert AI researcher specializing in LLMs.
* **Task:** I am going to ask you questions.
* **Core Instruction:** Ensure your response is factually accurate.
    - Rely on external sources of information where possible.
    - Use your own knowledge for well established and commonly known facts only.
    - Do not speculate about facts after your cutoff date.
* **Tools:** You can write and run Python code snippets using the libraries...
```

Good RASCEF example using XML:

```
<role>
You are an expert librarian specializing in books appropriate for teenagers.
</role>

<action>
Your objective is to recommend books based on user criteria.
</action>

<instructions>
1. Analyze the user's request in the <request> tag.
2. Provide three book recommendations.
3. For each recommendation, provide a 30-word summary.
4. Format the entire output as a Common Markdown page.
</instructions>

<request>
{user_input}
</request>
```

#### Consistency

Adopt and strictly follow conventions for terminology, naming, and formatting.
Remove inconsistencies in instructions.

Terminology examples:

* Bad: Answer using a Markdown table. The response must be at most 80 words.
* Good: Format the response as a Markdown table. Limit the response to 80 words.

Formatting examples:

* Bad: The user's name is CLIENT_NAME.
* Good: The user's name is {USER_NAME}.

Inconsistency example:

* Bad: Build a casual rapport with the user. Follow professional business
  etiquette rules. (contradiction between casual and professional)
* Good: Follow professional business etiquette rules. Maintain a positive tone.

#### Actionability

Pair each negative constraint with a clear expectation of what the model should
do instead.

Examples:

* Bad: Never use emoticons.
* Good: Do not use emoticons. Always use Unicode code points for emojis.

#### Groudedness

Replace the following with operational instructions.

* complex human abstractions
* concepts that assume the model is self-aware, such as its nature or training
  process

Examples on the model's nature:

* Bad: Do not hallucinate.
* Good: Base your answer solely on the included documents. If the answer is not
  in the documents, state that you could not find the answer.

Examples on the model's training process:

* Bad: Your training cutoff is 2021.
* Good: Today is Jan 12, 2026. All information provided in the `documents` tag
  is current. Assume that all your other time-bound information is out of date.

Examples on abstract concepts:

* Bad: Only include well-known and commonly accepted information.
* Good: Summarize the key arguments in the provided documents. If the documents
  contain conflicting statements, summarize each viewpoint and provide a
  citation.

#### Well-formedness

Check for spelling and grammar errors.

Remove extraneous white space and redundant formatting.

Examples:

* Bad: "your a professional tehnical writer.." (typos, redundant period)
* Good: You are a professional technical writer.

#### Output format and structure

Use an output format suited for the consumer of the output.

Provide a formal JSON schema when the output format is JSON.

Good example for mathematical content rendered in a browser:

```
The response must follow the rules below:

- **LaTeX activation:** Use LaTeX for math and science formulas.
- **Encapsulation:** Use `$...$` for inline math. Use `$$...$$` for block math.
- **Prohibited:** Do not generate LaTeX document code.
```

#### Reasoning for complex tasks

Use chain of thought (CoT) prompting for complex tasks.

Example: Think step by step.

#### Examples

Guide behavior using few-shot prompting.

2-5 examples are sufficient. Verify that the examples follow the input and
output structure.

Good example of few-shot prompting:

```
Classify the sentiment of the user-provided text into one of the following
classes: "positive", "negative", "neutral". Respond with a single word. Follow
the examples below.

<examples>
Text: There is nothing good about the new update.
Response: negative

Text: The new button is a massive time saver.
Response: positive
</examples>
```

### Review rubric

Review system prompts for AI large language models by following the instructions
below.

Respond with a JSON object that follows the specification.

The `issues` key contains all the deviations from the review rubric. The
deviations are grouped according to the rubric item. Deviations to the same
rubric item are strings in an array.

Partial example:

```json
{
  "issues": {
    "clarity": {
      "ambiguous": [],
      "irrelevant": [
        "The server OS is not relevant for fetching HTTP requests",
        "The class architecture is not relevant for launching a container"
      ],
      "indirect": []
    }
  }
}
```

The `issues` object keys and subkeys are:

* `clarity`
  * `ambiguity` - ambiguous or unclear parts of the prompt
  * `irrelevant` - text that doesn't seem connected to the prompt's objective
  * `indirect` - indirect references to the model
* `specificity`
  * `objective` - missing information for understanding the desired outcome
  * `format` - missing output format specification
  * `structure` - incomplete structure specification, in case of structured output
    such as JSON or code
  * `style` - missing or insufficient style guidelines for output artifacts
* `organization`
  * `objective` - the prompt does not begin with a high-level objective
  * `progression` - a high-level instruction placed after low-level details
  * `disjoint` - instructions that cover the same aspect but live in different
    parts of the prompt
* `structure`
  * `instructions` - instructions that aren't clearly marked by XML tags or
    Markdown sections
  * `context` - context elements that aren't clearly marked by XML tags or
    Markdown sections
  * `examples` - examples (positive or negative) that aren't clearly marked by
    XML tags or Markdown sections
* `consistency`
  * `terminology` - different terms that refer to the same concept
  * `naming` - multiple explanations of the same concept
  * `formatting` - parts of the prompt that use different formatting
  * `contradictions` - parts of the prompt that can't be true at the same time
* `inactionable`
  * `instructions` - negative objectives that are not accompanied by contrasting
    positive objectives
  * `examples` - negative examples that are not preceded or succeeded by
    positive examples
* `ungrounded` - instructions that rely on abstract meta-concepts
* `malformed`
  * `typos` - incorrectly spelled words
  * `grammar` - grammatical errors
  * `formatting` - extraneous white space
