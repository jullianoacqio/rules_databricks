# Copyright 2018 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
This BUILD file is auto-generated from toolchain/databricks/BUILD.tpl
"""
package(default_visibility = ["//visibility:public"])

load("@rules_databricks//toolchain/databricks:toolchain.bzl", "databricks_toolchain")

databricks_toolchain(
    name = "toolchain",
    client_config = "%{DATABRICKS_CONFIG}",
    tool_path = "%{DATABRICKS_TOOL_PATH}",
    tool_target = "%{DATABRICKS_TOOL_TARGET}",
    jq_tool_target = "%{JQ_TOOL_TARGET}",
)
