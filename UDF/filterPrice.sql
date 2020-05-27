drop function Pizaria.filterItem;
go

go
create function Pizaria.filterItem (
	@price			money 			= 922337203685477.5807,
	@name			varchar(30)		= '',
	@item_type		varchar(30)
	)	returns @returnTable TABLE 
                     (nome varchar(30) not NULL, 
                      preco money not NULL,
					  quantidade int)
as
	begin
		if (@item_type = 'Piza')
			begin
				INSERT INTO @returnTable
					select nome, preco, null
					from Pizaria.Piza join Pizaria.Item on Piza.ID=Item.ID
					where preco<=@price and nome like @name+'%'
				RETURN;
			end

		else if (@item_type = 'Bebida')
			begin
				INSERT INTO @returnTable
					select nome, preco, quantidade_disponivel 
					from  Pizaria.Bebida join Pizaria.Item on Item.ID=Bebida.ID
					where preco<=@price and nome like @name+'%'
					order by preco
				return;
			end

		else if (@item_type = 'Menu')
			begin
				INSERT INTO @returnTable
					select nome, preco, null
					from  Pizaria.Menu join Pizaria.Item on Menu.ID=Item.ID 
					where preco<=@price and nome like @name+'%'
					order by preco
				return;
			end

		else if (@item_type = 'Ingredientes')
			begin
				insert into @returnTable
					select nome, preco, quantidade_disponivel
					from  Pizaria.Ingrediente join Pizaria.Item on Ingrediente.ID=Item.ID 
					where preco<=@price and nome like @name+'%'
					order by preco
				return;
			end
		return;
	end
go


--select * from Pizaria.filterItem(7, DEFAULT, 'Piza') order by 1 desc -- 2 ordem ascendente

-- trigger ou qql merda pa verificar quantidades disponiveis de ing e bebidas da encomenda
-- admin no futuro pode dar restock se tivermos tempo


