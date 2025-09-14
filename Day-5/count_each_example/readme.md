🔹 1. Using count (index-based)

Best when you just need N identical resources.

You access resources by index (count.index).

✅ Example: Create 3 EC2 instances with count

-----
This creates:

web[0]

web[1]

web[2]

But if you remove one in the middle (say web[1]), Terraform may recreate resources because indexes shift.

----------------------------------------
Using for_each (map/set-based)

Best when you want uniquely identified resources.

You access resources by key (each.key, each.value).

✅ Example: Create EC2 instances for specific environments

-----
This creates:

web["dev"] → t2.micro

web["qa"] → t2.small

web["prod"] → t2.medium

And if you remove "qa", only that one is destroyed — others remain untouched (no index shifting problem).
---------------------------------------------------
--------------------------------------------------
Key Differences
Feature	count	for_each
Indexing	Uses numeric index (count.index)	Uses map/set keys (each.key)
When to Use	Fixed number of similar resources	Resources tied to unique keys/names
Change Impact	Risk of re-creation when index changes	Safe, only affected key changes
Example	3 identical EC2s	EC2s for dev, qa, prod