SELECT *
FROM sales_contracts
WHERE sales_date BETWEEN '2024-01-01' AND '2024-12-31'
	AND VIN IN (
		SELECT VIN FROM inventory WHERE dealership_id = 1
    );