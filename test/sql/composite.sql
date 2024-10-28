CREATE TYPE complex AS (
    r       double precision,
    i       double precision
);

CREATE TYPE inventory_item AS (
    name            text,
    supplier_id     integer,
    price           numeric
);

CREATE TABLE on_hand_odd (
    item      inventory_item,
    count     integer
);

INSERT INTO on_hand_odd VALUES (ROW('aqua man', 1, 3.45), 324); 
INSERT INTO on_hand_odd VALUES (ROW('iron man', 4, 2.69), 76); 
INSERT INTO on_hand_odd VALUES (ROW('venom', 4, 8.99), 12); 
INSERT INTO on_hand_odd VALUES (ROW('fuzzy dice', 42, 1.9), 10000);
INSERT INTO on_hand_odd VALUES (ROW('fuzzy dice', 5, 9.1), 10); 

select item from on_hand_odd order by item;

select median(item) from on_hand_odd;

CREATE TABLE on_hand_even (
    item      inventory_item,
    count     integer
);

INSERT INTO on_hand_even VALUES (ROW('fuzzy dice', 42, 1.9), 10000);
INSERT INTO on_hand_even VALUES (ROW('aqua man', 1, 3.45), 324); 
INSERT INTO on_hand_even VALUES (ROW('iron man', 4, 2.69), 76); 
INSERT INTO on_hand_even VALUES (ROW('venom', 4, 8.99), 12); 

select item from on_hand_even order by item;

select median(item) from on_hand_even;


