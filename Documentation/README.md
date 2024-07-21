# OpenFAN Documentation

OpenFAN document is created using `mkdocs`.

You can access them online at [https://sasakaranovic.github.io/OpenFanController/](https://sasakaranovic.github.io/OpenFanController/)

Source files are located inside the `src` folder if you want to explore or contribute.

## Testing locally

```shell
cd src
poetry install
poetry run mkdocs serve
```

Then open your browser to the localhost address shown, likely http://localhost:8000

You can also test building the result

```shell
cd src
poetry install
poetry run mkdocs build

cd ..
cd docs-html
python -m http.server
```

Then open your browser to the localhost address shown, likely http://localhost:8000
