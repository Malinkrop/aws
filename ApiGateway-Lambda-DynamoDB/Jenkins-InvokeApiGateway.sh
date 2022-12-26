echo $urlapigw
echo $Operacion

case $Operacion in
	create)
    echo 'Create Operation Executed'
    payloadstring='"rut":"'$id'", "nombre":"'$name'", "apellido":"'$apellido'"'
    curl -X POST -d "{\"operation\":\"$Operacion\",\"tableName\":\"apilambdadb\",\"payload\":{\"Item\":{ $payloadstring }}}" $urlapigw
    ;;
	read)
		echo 'Read Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$Operacion\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }}}" $urlapigw
		;;
	list)
    echo 'List Operation Executed'
    curl -X POST -d "{\"operation\":\"$Operacion\",\"tableName\":\"apilambdadb\",\"payload\":{\"Item\":{\"id\":\"2\"}}}" $urlapigw
		;;
  delete)
		echo 'Delete Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$Operacion\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }}}" $urlapigw
		;;
	update)
		echo $Operacion 'Operation Executed'
    payloadstring='"id":"'$id'"'
  	curl -X POST -d "{\"operation\":\"$Operacion\",\"tableName\":\"apilambdadb\",\"payload\":{\"Key\":{ $payloadstring }, \"UpdateExpression\": \"set occupation=:o\", \"ExpressionAttributeValues\":{ \":o\": \"$apellido\"}}}" $urlapigw
  	;;
esac
