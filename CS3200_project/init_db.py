values = [
    (1, 39),
    (2, 98),
    (3, 78),
    (4, 81),
    (5, 59),
    (6, 52),
    (7, 16),
    (8, 37),
    (9, 78),
    (10, 72),
    (11, 6),
    (12, 25),
    (13, 38),
    (14, 90),
    (15, 42),
    (16, 67),
    (17, 0),
    (18, 23),
    (19, 43),
    (20, 68),
    (21, 54),
    (22, 42),
    (23, 33),
    (24, 41),
    (25, 87),
    (26, 72),
    (27, 21),
    (28, 32),
    (29, 4),
    (30, 26)
]

# Dictionary to store encountered pairs
pair_dict = {}

# Flag to track if there are any duplicates
has_duplicates = False

# Iterate through the values and check for duplicates
for admin_id, course_id in values:
    pair = (admin_id, course_id)
    if pair in pair_dict:
        has_duplicates = True
        print(f"Duplicate pair found: {pair}")
    else:
        pair_dict[pair] = True

if not has_duplicates:
    print("No duplicate pairs found.")