SELECT SUM(t.quantidade)/COUNT(t.numero_pedido)  FROM pedidos p JOIN item_pedidos t ON t.numero_pedido = p.numero_pedido
