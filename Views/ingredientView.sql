create view Pizaria.IngredienteView as
select nome, preco, Ingrediente.ID, quantidade_disponivel from Pizaria.Ingrediente join Pizaria.Item on Item.ID=Ingrediente.ID 