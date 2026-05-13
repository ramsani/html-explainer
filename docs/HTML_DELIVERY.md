# HTML Delivery

Intent: remove friction after an HTML artifact is generated.

The value appears when the user opens the file. Do not make the user hunt for it.

## Delivery contract

After generating an HTML file:

```text
Created:
Open:
Pattern:
Budget:
Decision:
Next command:
```

`Open` should be a clickable absolute path when the environment supports file links.

## Save location

When generating an artifact inside a repo, avoid writing it to the repo root unless the user explicitly asks for that.

Prefer:

```text
<repo>/.html-explainer/artifacts/<clear-slug>.html
```

or an existing artifact/output directory if the repo already has one.

Why:

- generated HTML should not pollute the project root;
- later repo recaps should not treat local review artifacts as product files;
- the user still gets a clickable absolute path;
- curated examples remain in `examples/`.

## Open behavior

When tool access allows it and doing so will not disrupt the user:

- save the artifact to a reasonable local path;
- open it in the browser automatically;
- still return the clickable path in the final response.

When opening the browser is not available or would require disruptive approval:

- do not block the workflow;
- return a clickable local path;
- state that the file is ready to open.

## Path rule

Use absolute paths in final responses.

Good:

```text
Open: [project-recap.html](/Users/papa/0Proyectos/html-explainer/.html-explainer/artifacts/project-recap.html)
```

Bad:

```text
Open project-recap.html
```

## Friction rule

Do not paste full HTML into chat unless the user asks.

The chat response should be short. The artifact does the heavy lifting.

## Hard fails

Revise the final response if:

- it says an artifact was created but gives no path;
- it gives only a relative path;
- it hides the file location inside a long summary;
- it makes the user ask how to open the artifact.
