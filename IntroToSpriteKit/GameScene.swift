//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Caroline Davis on 19/01/2017.
//  Copyright © 2017 Caroline Davis. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // creates the node
    let myNode = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        // will position node in centre and scale image+
        myNode.position = CGPoint(x: 0, y: 350)
        myNode.setScale(0.8)
        
        // creates a body of the node - by default physicsbody is affected by gravity
        myNode.physicsBody = SKPhysicsBody(circleOfRadius: myNode.size.height / 2)
        myNode.physicsBody?.affectedByGravity = true
        
        // category bitmask is a number defining the type of object this is for considering collisions.
        myNode.physicsBody?.categoryBitMask = 0
        
        // collision bit mask is a number defining what categories of objects this node should collide with - aka this node will collide with node2
        myNode.physicsBody?.collisionBitMask = 1

        // contact test bit mask is a number defining which collision we want to be notified about
        myNode.physicsBody?.contactTestBitMask = 1
        
        
        let node2 = SKSpriteNode(imageNamed: "Spaceship")
        
        // will position node in centre and scale image
        node2.position = CGPoint(x: 0, y: -150)
        node2.setScale(0.8)
        
        // creates a body of the node - by default physicsbody is affected by gravity
        node2.physicsBody = SKPhysicsBody(circleOfRadius: node2.size.height / 2)
        node2.physicsBody?.affectedByGravity = false
        node2.physicsBody?.categoryBitMask = 1
        node2.physicsBody?.collisionBitMask = 0
        
        
        // add node via code
        self.addChild(myNode)
        self.addChild(node2)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("We have a contact")
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("End of the contact")
    }
    
    // will register on release of button
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // insert code.
    }
    
    // scroll mouse around the scene and things appear
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when mouse moves along the screen
    }
    
    // if you can a notificaiton, msg or whatever when the app is running
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // code to support what happens when the app is interrupted or button cancelled etc.
    }
    
    // releases when button begins
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            // gets location when you touch. the spaceships appear
            let location = touch.location(in: self)
            let myNode1 = SKSpriteNode(imageNamed: "Spaceship")
            myNode1.position = location
            myNode1.setScale(0.2)
            self.addChild(myNode1)
            
            
        }
    }
    
    // function that is called before every frame, eg 60 fps = 60 times.
    override func update(_ currentTime: TimeInterval) {
//        myNode.position.x -= 1
    }
    
    
    
    
}




// #extras that you can put in didMove to create a custom spritenode

// ***scale is smaller than its usual size***
// myNode.xScale = 0.5
//  myNode.yScale = 0.5

// ***rotating node image***
//  myNode.zRotation = 40

// ***(change anchor point and rotate node forever)
//let action = SKAction.rotate(byAngle: 2, duration: (2))
//myNode.run(SKAction.repeatForever(action))
// myNode.anchorPoint = CGPoint(x: 0.2, y: 0.7)

//***move the node to this location***
//  let action = SKAction.move(to: CGPoint(x: 100, y: 200), duration: TimeInterval(2))
//myNode.run(SKAction.repeatForever(action))
//
//let action = SKAction.moveTo(y: 200, duration: TimeInterval(2))
//myNode.run(SKAction.repeatForever(action))

//**fades the node in on start up***
// only does this once.
//myNode.alpha = 0
//let action = SKAction.fadeIn(withDuration: TimeInterval(3))
//myNode.run(action)

//** stops second node getting pushed off screen***
// creates a body of the node - by default physicsbody is affected by gravity
//node2.physicsBody = SKPhysicsBody(circleOfRadius: node2.size.height / 2)
//node2.physicsBody?.affectedByGravity = false
//        node2.physicsBody?.isDynamic = false



// #extras for update current time interval

//         ***will move 1 space right each frame.***
//        myNode.position.x += 1

