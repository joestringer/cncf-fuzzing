cp $SRC/cncf-fuzzing/projects/cilium/elf_fuzzer.go $SRC/cilium/pkg/elf/
cp $SRC/cncf-fuzzing/projects/cilium/bpf_fuzzer.go $SRC/cilium/pkg/bpf/
cp $SRC/cncf-fuzzing/projects/cilium/matchpattern_fuzzer.go $SRC/cilium/pkg/fqdn/matchpattern/
cp $SRC/cncf-fuzzing/projects/cilium/hubble_parser_fuzzer.go $SRC/cilium/pkg/hubble/parser/
cp $SRC/cncf-fuzzing/projects/cilium/labels_fuzzer.go $SRC/cilium/pkg/k8s/slim/k8s/apis/labels/
mv $SRC/cilium/proxylib/cassandra/cassandraparser_test.go $SRC/cilium/proxylib/cassandra/cp_test_fuzz.go
mv $SRC/cncf-fuzzing/projects/cilium/OnData_fuzzer.go $SRC/cilium/proxylib/cassandra/
go mod tidy && go mod vendor

compile_go_fuzzer github.com/cilium/cilium/pkg/elf FuzzElfOpen fuzz_elf_open
compile_go_fuzzer github.com/cilium/cilium/pkg/bpf FuzzBpf fuzz_bpf
compile_go_fuzzer github.com/cilium/cilium/pkg/fqdn/matchpattern FuzzMatchpatternValidate fuzz_matchpattern_validate
compile_go_fuzzer github.com/cilium/cilium/pkg/fqdn/matchpattern FuzzMatchpatternValidateWithoutCache fuzz_matchpattern_validate_without_cache
compile_go_fuzzer github.com/cilium/cilium/pkg/hubble/parser FuzzParserDecode fuzz_parser_decode
compile_go_fuzzer github.com/cilium/cilium/pkg/k8s/slim/k8s/apis/labels FuzzLabelsParse fuzz_labels_parse
compile_go_fuzzer github.com/cilium/cilium/proxylib/cassandra FuzzParsers fuzz_parsers

