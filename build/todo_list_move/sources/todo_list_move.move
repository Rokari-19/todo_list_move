/*
/// Module: todo_list_move
*/
module todo_list_move::todo_list_move;
use std::string::String;

public struct TodoList has key, store {
    id: UID,
    items: vector<String>
}



// creating a new todo list
public fun new(ctx: &mut TxContext): TodoList {
    let list = TodoList {
        id: object::new(ctx),
        items: vector[]
    };

    (list)
}
// update the todo list
public fun add(list: &mut TodoList, item: String) {
    list.items.push_back(item)
}
// remove an item from the list by index
public fun remove(list: &mut TodoList, index: u64): String {
    list.items.remove(index)
}

// delete the list itself and capability to manage it
public fun delete(list: TodoList) {
    let TodoList {id ,items: _ } = list;
    id.delete()
}

// getting the length of the list
public fun length(list: &TodoList): u64 {
    list.items.length()
}

