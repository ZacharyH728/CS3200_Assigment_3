-- lists all the customers who listen to longer than average tracks excluding those more than 15 minutes
SELECT DISTINCT customer.CustomerId
FROM customers customer
INNER JOIN invoices invoice ON customer.CustomerId = invoice.CustomerId
INNER JOIN invoice_items invoice_item ON invoice.InvoiceId = invoice_item.InvoiceId
INNER JOIN tracks track ON invoice_item.TrackId = track.TrackId
WHERE track.Milliseconds >
    (SELECT AVG(Milliseconds) FROM tracks WHERE Milliseconds < 900000)