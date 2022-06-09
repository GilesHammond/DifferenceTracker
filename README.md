# DifferenceTracker

DifferenceTracker is a lightweight extension to Swift's `CollectionDifference`. It defines
moves in addition to removals and insertions, critical when updating interfaces and managing 
reference types.

DifferenceTracker can be used to perform animated updates on `NSTableViews` and `NSOutlineViews`
between `beginUpdates()` / `endUpdates()` calls. This does **not** currently support updating 
`UITableView`, `UICollectionView` or `NSCollectionView` within a `performBatchUpdates()` call, 
which requires subtly different ordering.

DifferenceTracker generates an array of steps that can be applied iteratively to an interface, or
associated collection, to move, insert and remove elements. Apart from the first and last steps, 
all step indexes are transient and do not relate directly to the start or end collections.

## Example Usage

    outlineView.beginUpdates()
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
    outlineView.endUpdates()

## Acknowledgements

DifferenceTracker development was aided by [@paxos](https://github.com/paxos) and his [thorough test suite](https://github.com/paxos/NSOutlineViewPatchTestSuite). Thank you.

