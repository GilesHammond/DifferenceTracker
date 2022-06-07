# DifferenceTracker

DifferenceTracker is a lightweight extension to Swift's CollectionDifference. It supports
moves in addition to removals and insertions, critical when updating interfaces and managing 
reference types.

DifferenceTracker generates an array of steps that can be applied sequentially to an interface, or
associated collection, to move, insert and remove elements. Apart from the first and last steps, all
step indexes are transient and do not relate directly to the start or end collections.

## Example Usage

    for step in collectionDifference.steps {
        switch step {
        case let .remove(_, index):
            outlineView.removeItems(at: [index], inParent: node, withAnimation: animation)
                        
        case let .insert(element, index):
            outlineView.insertItems(at: [index], inParent: node, withAnimation: animation)

        case let .move(element, from, to):
            outlineView.moveItem(at: from, inParent: node, to: to, inParent: node)
        }
    }
