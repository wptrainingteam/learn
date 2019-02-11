#! /bin/bash

printf "[\n" > ../manifest.json
cd ../lesson-plans/

git submodule foreach -q '
	readme="https://raw.githubusercontent.com/wptrainingteam/$displaypath/$sha1/README.md";
	if [ "$(curl -s -w "%{http_code}\n" "$readme" -o /dev/null)" == "200" ];
	then
		printf "\t{\n" >> ../../manifest.json;
		printf "\t\t\"title\": \"$displaypath\",\n" >> ../../manifest.json;
		printf "\t\t\"slug\": \"$displaypath\",\n" >> ../../manifest.json;
		printf "\t\t\"markdown_source\": \"https://raw.githubusercontent.com/wptrainingteam/$displaypath/$sha1/README.md\",\n" >> ../../manifest.json;
		printf "\t\t\"parent\": null\n" >> ../../manifest.json;
		printf "\t},\n" >> ../../manifest.json;
	fi
';

sed -i '$ d' ../manifest.json
printf "\t}\n]" >> ../manifest.json;
