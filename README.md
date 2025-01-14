# veld_code__apache_jena_fuseki

This repo contains [code velds](https://zenodo.org/records/13322913) for running a stable and 
reproducible Apache Fuseki triplestore.

Some additional code velds are offered for importing and exporting data to and from the triplestore.

These can be either integrated into chain velds (see for example: 
https://github.com/veldhub/veld_chain__gutenberg_fuseki and 
https://github.com/veldhub/veld_chain__automatic_tei-ification_of_gutenberg ), or be used 
standalone by cloning this repo ad-hoc, and modyfing its data structure and respective veld yaml
files.

## requirements

- git
- docker compose

## how to use

A code veld may be integrated into a chain veld, or used directly by adapting the configuration 
within its yaml file and using the template folders provided in this repo. Open the respective veld 
yaml file for more information.

Run a veld with:
```
docker compose -f <VELD_NAME>.yaml up
```

## contained code velds

**[./veld_run_server.yaml](./veld_run_server.yaml)** : runs an Apache Fuseki Triplestore server, 
which can be reached at http://localhost:3030/ . Its configuration is stored in 
[./data/fuseki_config/](./data/fuseki_config/) and its data at
[./data/fuseki_data/](./data/fuseki_data/) . Important: leave this service running while executing 
other chain or code velds.

```
docker compose -f veld_run_server.yaml up
```

**[./veld_import_rdf.yaml](./veld_import_rdf.yaml)** : imports XML/RDF data from a given folder.

```
docker compose -f veld_import_rdf.yaml up
```

**[./veld_export.yaml](./veld_export.yaml)** : exports data given rq (sparql query) files (samples can
be found in [./data/queries/](./data/queries/)) into supported serializations which are saved into
[./data/fuseki_export/](./data/fuseki_export/)

```
docker compose -f veld_export.yaml up
```

