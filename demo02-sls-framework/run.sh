#1 Installar
npm i -g serverless

#2 sls inicializado
sls

#3 Sempre fazer deploy antes de tudo para verificar se o ambiente esta ok
sls deploy

# Invocar na AWS
sls invoke -f hello

# Invoke local
sls invoke local -f hello --log

# Configurar dashboard
sls