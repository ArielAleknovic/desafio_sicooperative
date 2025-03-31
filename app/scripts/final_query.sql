
SELECT
    a.nome AS nome_associado,
    a.sobrenome AS sobrenome_associado,
    a.idade AS idade_associado,
    m.vlr_transacao AS vlr_transacao_movimento,
    m.desc_transacao AS desc_transacao_movimento,
    m.data_movimento AS data_movimento,
    c.num_cartao AS numero_cartao,
    c.nome_impresso AS nome_impresso_cartao,
    co.tipo AS tipo_conta,
    co.data_criacao AS data_criacao_conta
FROM
    sicoperative.associado a
JOIN
    sicoperative.conta co ON a.id = co.id_associado
JOIN
    sicoperative.cartao c ON a.id = c.id_associado
JOIN
    sicoperative.movimento m ON c.id = m.id_cartao
ORDER BY
    a.id
