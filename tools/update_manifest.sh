#! /bin/bash

printf "[\n" > ../manifest.json
cd ../lesson-plans/

git submodule foreach -q '
		printf "\t{\n" >> ../../manifest.json;
		printf "\t\t\"title\": \"$displaypath\",\n" >> ../../manifest.json;
		printf "\t\t\"slug\": \"$displaypath\",\n" >> ../../manifest.json;
		printf "\t\t\"markdown_source\": \"https://raw.githubusercontent.com/wptrainingteam/$displaypath/$sha1/README.md\",\n" >> ../../manifest.json;
		printf "\t\t\"parent\": null\n" >> ../../manifest.json;
		printf "\t},\n" >> ../../manifest.json;
';

sed -i '$ d' ../manifest.json
printf "\t}\n]" >> ../manifest.json;
