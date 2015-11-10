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


Horace: how to implement inmutability
=====================================

implement a way to duplicate nodes.
*best way seems to be creating a new node and passing it the value, name and
links of the node we want to duplicate. Make sure to pass duplicates of the
links array and possible of the other data types*

when setting a new key, you have to return a whole new tree
*me: in hamt, when setting,  create a duplicate of the head node and keep
creating duplicates until the sought node (which is itself a duplication)
gets created/updated. This way i dont need to send back the whole tree, since
its been constructed from the beggining.*
