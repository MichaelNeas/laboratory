//
//  GameScene.swift
//  Pachinko
//
//  Created by Michael Neas on 9/11/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var ballCount = 10
    
    var editLabel: SKLabelNode!
    var editingMode: Bool = false {
        didSet {
            editLabel.text = editingMode ? "Done" : "Edit"
        }
    }
    let ballOptions = ["ballRed", "ballBlue", "ballCyan", "ballGreen", "ballGrey", "ballPurple", "ballYellow"]

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        // blend mode draws faster
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 980, y: 700)
        addChild(scoreLabel)
        
        editLabel = SKLabelNode(fontNamed: "Chalkduster")
        editLabel.text = "Edit"
        editLabel.position = CGPoint(x: 80, y: 700)
        addChild(editLabel)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let objects = nodes(at: location)
        if objects.contains(editLabel) {
            editingMode.toggle()
        } else {
            if editingMode {
                // create box
                // random size
                let size = CGSize(width: Int.random(in: 16...128), height: 16)
                let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0), size: size)
                // z rotation random number of radians
                box.zRotation = CGFloat.random(in: 0...3)
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                // don't move
                box.physicsBody?.isDynamic = false
                box.name = "box"
                addChild(box)
            } else if ballCount > 0 {
                ballCount -= 1
                let ball = SKSpriteNode(imageNamed: ballOptions.randomElement()!)
                ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
                // bouncy 0 -> 1
                ball.physicsBody?.restitution = 0.4
                // collisionBitMask tells us which node should I bump into
                // contactTestBitMask what to listen to/what we care about
                // we don't know what order the contacts happen, so we have to find out which is the ball
                ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
                ball.position = CGPoint(x: location.x, y: 700)
                ball.name = "ball"
                addChild(ball)
                
        //        let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
        //        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        //        box.position = location
        //        addChild(box)
            }
        }
    }
    
    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode
        // angles are randians, 2*pi radians is full circle
        slotBase = SKSpriteNode(imageNamed: (isGood ? "slotBaseGood" : "slotBaseBad"))
        slotGlow = SKSpriteNode(imageNamed: (isGood ? "slotGlowGood" : "slotGlowBad"))
        slotBase.name = isGood ? "good" : "bad"
        
        slotBase.position = position
        slotGlow.position = position
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        addChild(slotGlow)
        addChild(slotBase)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spinForever)
    }
    
    func collision(between ball: SKNode, object: SKNode) {
        if object.name == "good" {
            score += 1
            ballCount += 1
            destroy(ball: ball)
        } else if object.name == "bad" {
            score -= 1
            destroy(ball: ball)
        } else if object.name == "box" {
            object.removeFromParent()
        }
    }
    
    func destroy(ball: SKNode) {
        // removes node from node tree
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
            fireParticles.position = ball.position
            addChild(fireParticles)
        }
        ball.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        if nodeA.name == "ball" {
            collision(between: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collision(between: nodeB, object: nodeA)
        }
    }
}
