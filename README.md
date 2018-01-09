# README
API solução para o Zombie Survival Social Network
No console utilizar os seguintes comandos para instalar gems e iniciar a base de dados: 
bundle install 
rake db:setup

utilizar o comando rails server no console para executar

Segue exemplos de chamadas

-Add survivors

method
POST

url
/survivors/

example JSON

{"survivor": {"name":"Maria","age": "30","gender":"female","latitude": 1200,"longitude":1300,"inventory": { "Ammunition": 5,"Water":2 }}}

-list all survivors

method
GET

url
/survivors/

-show survivor

method
GET

url
/survivors/:id

example
http://localhost:3000/survivors/2

-Update survivor location

method
PUT

url
/survivors/:id/location

example url
http://localhost:3000/survivors/9/location

example JSON
{"latitude": 25,"longitude":30}


-Flag survivor as infected

method
POST

url
/survivors/:id/reports

example url
http://localhost:3000/survivors/5/reports

example JSON
{"reporter": 30}

-Trade Items

method
POST

url
/trade

example url
http://localhost:3000/trade

example JSON
[{"survivor_id": 1, "items": {"Water": 2}}, {"survivor_id": 1, "items": {"Water": 1}}]

-relatórios

method
GET

/infected
/non_infected
/resources_average
/points_lost