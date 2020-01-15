

/// Inserting a Single Audio node, this method is complicated because there can be duplicated references to
/// Goals:
/// - see if there are any parents to that node in the tree already.  If that case is true, we need to insert the node as
/// a child and assign the previous child's children to the newly added node
/// - see if any of the nodes children are in the tree.  If this is true, we need to replace the parent of the children with the
/// new node and bubble up and non matching children accordingly
/// - Any node that doesn't have a parent in the tree goes to the root level
public func add(scene newNode: AudioNode) {
	// found represents finding a parent
	var found = false
	var queue = root.children
	
	// handle bubbling up parents
	// check to see if the new node being added has children in the queue
	let foundChildNodesInRootQueue = queue.filter(newNode.children.contains)
	if !foundChildNodesInRootQueue.isEmpty {
		newNode.children.forEach { nodeChild in
			// find the child from the new node in the queue
			if let foundChildNodeIndexInQueue = queue.firstIndex(where: { nodeChild == $0 }),
				let foundChildNodeInNewNode = foundChildNodesInRootQueue.first(where: { nodeChild == $0 }) {
				// assign the children from the queue to the children of the newly added node
				// in order to persist any previous children found in the tree
				nodeChild.children = foundChildNodeInNewNode.children
				queue.remove(at: foundChildNodeIndexInQueue)
			}
		}
		// add the new node to the queue, which should now have all the previous children
		queue.insert(newNode, at: 0)
		root.children = queue
		found = true
	}
	
	var seenScenes = Set(queue)
	
	// handle traverse through existing structure to insert the node if referenced
	var activeNode: AudioNode
	while !queue.isEmpty {
		activeNode = queue.removeFirst()
		seenScenes.insert(activeNode)
		// go through the node's children that are being processed, see if the new node being added is one of those children
		if let foundChildActiveNodeIndex = activeNode.children.firstIndex(where: { newNode == $0 }) {
			// if we found that one of the children exists in the tree, add the new nodes children
			activeNode.children[foundChildActiveNodeIndex].children = newNode.children
			// now that we found that the node exists in the tree, remove it from the unassigned parents section
			if let unassignedRootIndex = root.children.firstIndex(where: { newNode == $0 }) {
				root.children.remove(at: unassignedRootIndex)
			}
			found = true
		}
		
		// if there is convergence, aka a shared child, grab all the existing dependencies
		if let convergedActiveChild = activeNode.children.first(where: { newNode.children.contains($0) }),
			let newNodeChildIndex = newNode.children.firstIndex(where: {$0 == convergedActiveChild}) {
			newNode.children[newNodeChildIndex] = convergedActiveChild
		}
		
		activeNode.children.forEach { childNode in
			if !seenScenes.contains(childNode) && !queue.contains(childNode) {
				// add the currently processed node's children to the queue to continue the search
				queue.append(childNode)
			}
		}
		
	}
	
	// add the new node to the root level if it wasn't found anywhere else
	if !found {
		root.children.append(newNode)
	}
}