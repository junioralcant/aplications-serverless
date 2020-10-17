#1 criar arquivo de politica de seguranca

#2 criar role de seguranca na aws
aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

#3 Criar o arquivo com conteudo e zipa-lo 
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::208117863179:role/lambda-exemplo \
    | tee logs/lambda-create.log

#4 Invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# -- Atualizar, zipar
zip function.zip index.js

# Atualizar lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# Invocar e ver resultado    
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec-update.log

# Remover
aws lambda delete-function \
    --function-name hello-cli
aws iam delete-role \
    --role-name lambda-exemplo