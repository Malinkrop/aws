echo $urlapigw
echo $Operacion

case $SelecttheOperation in
	create)
    echo 'Create Operation Executed'
    payloadstring='"rut":"'$id'", "nombre":"'$name'", "apellido":"'$occupation'"'
    curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"apilambdadb\",\"payload\":{\"Item\":{ $payloadstring }}}" $apigatewayurl
    ;;
	read)
		echo 'Read Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }}}" $apigatewayurl
		;;
	list)
    echo 'List Operation Executed'
    curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"apilambdadb\",\"payload\":{\"Item\":{\"id\":\"2\"}}}" $apigatewayurl
		;;
  delete)
		echo 'Delete Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }}}" $apigatewayurl
		;;
	update)
		echo $SelecttheOperation 'Operation Executed'
    payloadstring='"id":"'$id'"'
  	curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }, \"UpdateExpression\": \"set occupation=:o\", \"ExpressionAttributeValues\":{ \":o\": \"$occupation\"}}}" $apigatewayurl
  	;;
esac
