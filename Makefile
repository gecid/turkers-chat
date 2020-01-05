build_frontend:
	rm -rf ./turkers/chats/react/bundles/ && npm run build

run_frontend:
	npm start

run_django:
	python turkers/manage.py runserver

run:
	make -j2 run_django run_frontend

deploy:
ifdef remote
	make build_frontend
	git add .
	git commit -q -m 'Autogenerated - Webpack build'
	git push $(remote) HEAD:master -f
	git reset --soft HEAD^
	git reset --hard
else
	echo 'Você deve passar um remote como parâmetro. Exemplo: make deploy remote=staging'
	exit 1
endif
