# Fact Sheet Protocol

The fact sheet prevents attractive but false HTML.

Use it before any serious HTML artifact.

## Required sections

### 1. Sources inspected

List each source actually inspected:

- files
- diffs
- commands
- docs
- issues
- PRs
- user-provided text
- external references when explicitly used

### 2. Verified facts

Each fact must be short and traceable.

Format:

```text
Fact: <claim>
Evidence: <file/command/doc/source>
Confidence: high | medium | low
```

### 3. Inferences

Separate inference from evidence.

Format:

```text
Inference: <reasoned conclusion>
Based on: <facts>
Risk: <why it might be wrong>
```

### 4. Unknowns

List what could not be verified.

Unknowns are not failure. Hidden unknowns are failure.

### 5. Risk-bearing claims

Identify claims that would cause bad decisions if wrong:

- security impact
- data migration impact
- production behavior
- auth/payment changes
- breaking API changes
- user-visible workflow changes
- cost/performance claims

### 6. Minimum validation

Define what would prove the artifact adequate:

- command output
- tests
- manual path check
- screenshot
- diff inspection
- user confirmation

## Rule

If the fact sheet is weak, the HTML must say so clearly.

Never use design quality to compensate for evidence quality.
