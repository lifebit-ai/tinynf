# tinynf

Test behaviour of `scratch = true` in the process scope

The expected behaviour when using `scratch = true` in a process scope is for the `.command.*` files to be retained in the process `work/xx/oooooooooooooooooooooooooooooo/` subdirectory.

```
# create a temp folder for running the nf script 
temp_folder=`mktemp -d` && cd $temp_folder

# Run the script from the with-scratch 
nextflow run https://github.com/lifebit-ai/tinynf -r with-scratch

# Inspect the work directory for the process with and without scratch
tree -a work
```

You should see something similar to the following:

<details>
<summary>

</summary>

```
work
├── 4d
│   └── 5f49990d2ab44378984bcbb146ea15
│       ├── .command.begin
│       ├── .command.err
│       ├── .command.log
│       ├── .command.out
│       ├── .command.run
│       ├── .command.sh
│       └── .exitcode
├── c5
│   └── 35de6817f05974beb7ed76742c3653
│       ├── .command.begin
│       ├── .command.err
│       ├── .command.log
│       ├── .command.out
│       ├── .command.run
│       ├── .command.sh
│       ├── .exitcode
│       └── empty_file.txt -> /Users/admin/lifebit-ai/tinynf/work/stage/ef/ab2a2ab7049782907cdad2a439de7d/empty_file.txt
└── stage
    ├── da
    │   └── e46bc7ea606ba821e45faa6e3ea1e1
    │       └── empty_file.txt
    └── ef
        └── ab2a2ab7049782907cdad2a439de7d
            └── empty_file.txt
```
</details>
