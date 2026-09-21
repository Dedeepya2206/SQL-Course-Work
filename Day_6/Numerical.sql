-- 1. Absolute value
SELECT Abs(-25), ABS(30);

-- 2. Ceiling / Round Up
SELECT Ceil(12.3), CEIL(-12.7);

-- 3. Floor / Round Down
SELECT floor(12.9), FLOOR(-12.3);

-- 4. Round
SELECT ROUND(123.4567, 2), ROUND(123.4567, 3);

-- 5. Truncate
SELECT TRUNCATE(123.4567, 2), TRUNCATE(123.4567, 3);

-- 6. Power / Exponent
SELECT POW(2, 3), POWER(5, 2);

-- 7. Square Root
SELECT SQRT(16), SQRT(2);

-- 8. Madulo / Remainder
SELECT MOD(10, 3);

-- 9. Random Number
SELECT rand(),ranD(10);

-- 10. pi constant
SELECT PI();

-- 11. Sign 
SELECT SIGN(-25), SIGN(0), SIGN(30);

-- 12. Greast value
SELECT GREATEST(10, 39, 60, 4, 60, 100);

-- 13. Least Value
SELECT LEAST(10, 39, 60, 4, 60, 100);