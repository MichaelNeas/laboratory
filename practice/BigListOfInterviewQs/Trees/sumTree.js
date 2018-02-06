//Given a binary tree which is a sum tree (child nodes add to parent), write an algorithm to determine whether the tree is a valid sum tree
const sumTree = {
    "root" : {
        "val": 142,
        "left": {
            "val": 37,
            "left": {
                "val": 1,
                "left": null,
                "right": null
            },
            "right": {
                "val": 18,
                "left": {
                    "val": 10,
                    "left": null,
                    "right": null
                },
                "right": {
                    "val": 4,
                    "left": {
                        "val": 1,
                        "left": null,
                        "right": null
                    },
                    "right": {
                        "val": 3,
                        "left": null,
                        "right": null
                    }
                }
            }
        },
        "right": {
            "val": 34,
            "left": {
                "val": 2,
                "left": null,
                "right": null
            },
            "right": {
                "val": 16,
                "left": {
                    "val": 6,
                    "left": {
                        "val": 2,
                        "left": null,
                        "right": null
                    },
                    "right": {
                        "val": 4,
                        "left": null,
                        "right": null
                    }
                },
                "right": {
                    "val": 4,
                    "left": null,
                    "right": null
                }
            }
        }
    }
};

let summer = node => {
    if(node == null) return 0;
    return summer(node.left) + node.val + summer(node.right);
}

function isValidSumTree(node){
    if(node === null) return;
    let leftsum  = summer(node.left);
    let rightsum = summer(node.right);
    console.log(leftsum, rightsum)
    if(node.val === leftsum + rightsum) return true;
    else return false;
}

console.log(isValidSumTree(sumTree.root));