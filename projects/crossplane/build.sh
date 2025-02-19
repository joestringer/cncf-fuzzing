#!/bin/bash -eu
# Copyright 2022 Ada Logics Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

mv $SRC/fuzz.go $SRC/crossplane/internal/xpkg/
mv $SRC/composition_fuzzer.go $SRC/crossplane/internal/controller/apiextensions/composition/
mv $SRC/composite_fuzzer.go $SRC/crossplane/internal/controller/apiextensions/composite/
mv $SRC/manager_fuzzer.go $SRC/crossplane/internal/controller/pkg/manager/
go mod tidy
rm /root/go/pkg/mod/github.com/aws/aws-sdk-go-v2/internal/ini@v1.3.11/fuzz.go

compile_go_fuzzer github.com/crossplane/crossplane/internal/xpkg FuzzParse fuzz_parse
compile_go_fuzzer github.com/crossplane/crossplane/internal/controller/apiextensions/composition FuzzNewCompositionRevision fuzz_NewCompositionRevision
compile_go_fuzzer github.com/crossplane/crossplane/internal/controller/apiextensions/composite FuzzAsComposition fuzz_AsComposition
compile_go_fuzzer github.com/crossplane/crossplane/internal/controller/pkg/manager FuzzPackageRevision fuzz_PackageRevision
