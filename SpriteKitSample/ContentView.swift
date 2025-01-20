//
//  ContentView.swift
//  SpriteKitSample
//
//  Created by Luis Alejandro Ramirez Suarez on 20/01/25.
//

// Import the necessary frameworks
import SwiftUI
import SpriteKit

// Create a custom SKScene
class GameScene: SKScene {
    private var sprite: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        
        // Add a sprite node
        sprite = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        if let sprite = sprite {
            sprite.position = CGPoint(x: 100, y: 500)
            sprite.name = "player"
            addChild(sprite)
            
            // Add a simple action
            let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 1)
            let moveLeft = SKAction.moveBy(x: -100, y: 0, duration: 1)
            let moveUp = SKAction.moveBy(x: 0, y: 200, duration: 1)
            let moveDown = SKAction.moveBy(x: 0, y: -200, duration: 1)
            let moveSequence = SKAction.sequence([moveRight, moveDown, moveLeft, moveUp])
            let rotateAction = SKAction.rotate(byAngle: .pi, duration: 2)
            let combinedAction = SKAction.group([moveSequence, rotateAction])
            sprite.run(SKAction.repeatForever(combinedAction))
        }
        
        // Add multiple randomly positioned sprites
        for i in 0..<5 {
            let randomPoint = CGFloat.random(in: 0...100)
            let obstacle = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
            obstacle.position = CGPoint(
                x: CGFloat(i)*randomPoint,
                y: CGFloat(i)*randomPoint
            )
            obstacle.name = "obstacle\(i)"
            addChild(obstacle)
        }
    }
}

// Create a SwiftUI view that hosts the SpriteKit scene
struct SpriteKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = GameScene(size: CGSize(width: 300, height: 600))
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {}
}

// Main SwiftUI ContentView
struct ContentView: View {
    var body: some View {
        SpriteKitView()
    }
}


#Preview {
    ContentView()
}
