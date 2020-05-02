# Batch Rename - Shell script

`batch_rename.sh` is a safe solution to batch rename files and directories recursively, starting from the current directory and to any subdirectories.

> Recursively - operating on a directory and its contents, including the contents of any subdirectories.

## Example

In the example below, all files and directories that have spaces in their names are renamed with replacing spaces with underscores.

Before:

```
tree
.
|-- a dir
|   `-- file with spaces.txt
`-- b dir
    |-- another file with spaces.txt
    `-- yet another file with spaces.pdf
```

After:

```
tree
.
|-- a_dir
|   `-- file_with_spaces.txt
`-- b_dir
    |-- another_file_with_spaces.txt
    `-- yet_another_file_with_spaces.pdf
```


## Usage

For example, to recursively replace spaces with underscores in the names of all files and directories, follow these steps.

1. Before you run the script, you must set the script executable permission. This is done only once, before the very first run of the script.
```
chmod +x batch_rename.sh
```

2. Go to the directory where you want to rename files and directories recursively (starting from the current directory and to any subdirectories).
```
cd /home/user/example
```

3. Run the `batch_rename.sh` file with two parameters. Syntax is `batch_rename.sh "find_this" "replace_with_this"`. In this example parameters are set to ` ` (space) and `_` (underscore).
```
~/batch_rename.sh " " "_"
```

> **Note!** In the example above, the `batch_rename.sh` file is located in the user home directory (`~/`). Change it according to the location of the file in your case.


## Contributing

Welcome and thanks! I appreciate you taking the initiative to contribute to this project.

Contributing isn’t limited to just code. I encourage you to contribute in the way that best fits your abilities, by writing tutorials, making translation to your native language, giving a demo at your local meetup, helping other users with their support questions, or revising  the documentation for this project.

Please take a moment to read the guidelines in the [CONTRIBUTING.md](CONTRIBUTING.md). Following them helps to communicate that you respect the time of the other contributors to the project. In turn, they’ll do their best to reciprocate that respect when working with you, across timezones and around the world.


## Security Vulnerabilities

If you discover a security vulnerability within this script, please send an email to me. All security vulnerabilities will be promptly addressed.


## License

This script is open-sourced software licensed under the [MIT](LICENSE.md) and is distributed free of charge.

Commercial licensing (e.g. for projects that can’t use an open-source license) is available upon request.


## Author

Arthur Garegnyan

* Email: arthurgareginyan@gmail.com

* GitHub: [https://github.com/ArthurGareginyan/](https://github.com/ArthurGareginyan/)

* Website: [http://www.arthurgareginyan.com](http://www.arthurgareginyan.com)

* Donation: [http://www.arthurgareginyan.com/donate.html](http://www.arthurgareginyan.com/donate.html)
