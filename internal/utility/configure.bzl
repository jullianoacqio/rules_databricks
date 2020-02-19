# Copyright 2017 The Bazel Authors. All rights reserved.
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
load("//internal/utils:providers.bzl", "ConfigureInfo")

def _impl(ctx):
    profile = ctx.attr.profile or ""
    cluster_name = ctx.attr.cluster_name or ""
    if not profile.strip():
        fail("The profile value is mandatory.")
    if not cluster_name.strip():
        fail("The cluster name value is mandatory.")

    return [
        ConfigureInfo(
            profile = profile.upper(),
            cluster_name = cluster_name,
        )
    ]

configure = rule(
    implementation = _impl,
    attrs = {
        "profile": attr.string(
            default = "DEFAULT",
            mandatory = True
        ),
        "cluster_name": attr.string(
            mandatory = True
        ),
    }
)