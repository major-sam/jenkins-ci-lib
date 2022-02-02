INSERT INTO BetTypes
select * from BaltbetWeb_data.dbo.BetTypes
print 'update BetTypes'
go

INSERT INTO CurrencyTypes
select * from BaltbetWeb_data.dbo.CurrencyTypes
print 'update CurrencyTypes'
go

INSERT INTO Languages
select * from BaltbetWeb_data.dbo.Languages
print 'update Languages'
go

INSERT INTO SlotTransactionType
select * from BaltbetWeb_data.dbo.SlotTransactionType
print 'update SlotTransactionType'
go

INSERT INTO TranslationsMain
select * from BaltbetWeb_data.dbo.TranslationsMain
print 'update TranslationsMain'
go

INSERT INTO WebTransactionTypes
select * from BaltbetWeb_data.dbo.WebTransactionTypes
print 'update WebTransactionTypes'
go

