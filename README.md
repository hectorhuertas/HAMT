HAMT - Hash Array Mapped Trie
=============================
https://github.com/turingschool/data_structures_and_algorithms/tree/master/hash_array_mapped_tries

Nodes
=====

Each node should store 3 things
1-A key
2- A value
3-links to their 32 children


ToDo
====

low-review index.rb readability and testing

Implement inmutability
  when ovewriting key ---> WRONG! Ask Horace about how it should owrk
    create new node
    assign old node links to new node
    change link of previous node to the node just created

New trie when at the bottom
