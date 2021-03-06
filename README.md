# Databricks Rules for Bazel

## Overview

This repository contains rules for interacting with Databricks configurations/clusters.

## Requirements

* Python Version > 3.6

## Setup

Add the following to your `WORKSPACE` file to add the necessary external dependencies:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# This requires that python be available in your distribution,
# as this project uses rules_python to build the binary databricks cli.

http_archive(
    name = "rules_databricks",
    urls = [
        "https://github.com/acqio/rules_databricks/archive/<revision>.tar.gz"
    ],
    sha256 = "<sha256>",
    strip_prefix = "rules_databricks-<revision>",
)

load("@rules_databricks//databricks:repositories.bzl", databricks_repositories = "repositories")

databricks_repositories()

load("@rules_databricks//databricks:deps.bzl", databricks_deps = "deps")

databricks_deps()

register_toolchains("@rules_databricks//databricks/toolchain:default_linux_toolchain")
```

Add the flag `--build_python_zip` following to your `.bazelrc` to create a python executable zip:

```
run --build_python_zip
```

## Simple usage

The rules_databricks target can be used as executables for custom actions or can be executed directly by Bazel. For example, you can run:

```sh
bazel run @rules_databricks//:cli -- -h
```

## Set up Authentication
<a name="databricks_authentication"></a>

Then set up authentication using username/password or [authentication token](https://docs.databricks.com/api/latest/authentication.html#token-management). Credentials are stored at ``~/.databrickscfg``.

- `bazel run @rules_databricks//:cli -- configure --token` (enter hostname/auth-token at prompt)

Multiple connection profiles are also supported with `bazel run @rules_databricks//:cli -- configure --profile <profile> [--token]`.
The connection profile can be used as such: `bazel run @rules_databricks//:cli -- workspace ls --profile <profile>`.

To test that your authentication information is working, try a quick test like `bazel run @rules_databricks//:cli -- workspace ls`.

## Rules

* [dbk_configure](docs/dbk_configure.md)
* [dbk_fs](docs/dbk_fs.md)
* [dbk_instance_pools](docs/dbk_instance_pools.md)
* [dbk_libraries](docs/dbk_libraries.md)

# Things that don't work yet
* Support for Windows and Mac. For the moment everything assumes your host and target is `x86_64-unknown-linux-gnu`
