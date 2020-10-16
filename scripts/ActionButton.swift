//
//  ActionButton.swift
//  miniChallengeTeste
//
//  Created by Carlos Fontes on 06/06/19.
//  Copyright © 2019 Carlos Fontes. All rights reserved.
//

import SpriteKit

class ActionButton: SKSpriteNode {
    
    var botaoPressionado = false
    var nodeLocation = SKNode()
    var personagem = SKSpriteNode()
    var animacaoAD = SKAction()
    var animacaoAE = SKAction()
    var animacaoPD = SKAction()
    var animacaoPE = SKAction()
    var animacaoFD = SKAction()
    var animacaoFE = SKAction()
    var personagemAD:[SKTexture] = []
    var personagemAE:[SKTexture] = []
    let personagemPD:[SKTexture] = [SKTexture(imageNamed: "Parado D 1"),SKTexture(imageNamed: "Parado D 2"), SKTexture(imageNamed: "Parado D 1")]
    let personagemPE:[SKTexture] = [SKTexture(imageNamed: "Parado E 1"), SKTexture(imageNamed: "Parado E 2"), SKTexture(imageNamed: "Parado E 1")]
    let personagemFD:[SKTexture] = [SKTexture(imageNamed: "FD1"), SKTexture(imageNamed: "FD2e4"), SKTexture(imageNamed: "FD3")]
    init(position: CGPoint, color: UIColor, buttonSize: CGSize, name: String, _ imagem: String,person: SKSpriteNode) {
        super.init(texture: SKTexture(), color: color, size: buttonSize)
        self.personagem = person
        self.position = position
        self.name = name
        self.color = color
        self.zPosition = 5
        self.texture = SKTexture(imageNamed: imagem)
        self.alpha = 0.4
        self.isUserInteractionEnabled = true
        
        for i in 1...6 {
            personagemAD.append(SKTexture(imageNamed: "AD\(i)"))
        }
        
        for i in 1...6 {
            personagemAE.append(SKTexture(imageNamed: "AE\(i)"))
        }
        
        animacaoAD = SKAction.animate(with: personagemAD, timePerFrame: 0.1)
        animacaoAE = SKAction.animate(with: personagemAE, timePerFrame: 0.1)
        animacaoPD = SKAction.animate(with: personagemPD, timePerFrame: 0.4)
        animacaoPE = SKAction.animate(with: personagemPE, timePerFrame: 0.4)
        animacaoFD = SKAction.animate(with: personagemFD, timePerFrame: 0.3)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Touches Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = self.atPoint(location)
            switch(nodeTouched.name){
            case "botaoEsquerda":
                self.personagem.run(.repeatForever(self.animacaoAE))
            case "botaoDireita":
                self.personagem.run(.repeatForever(self.animacaoAD))
            default:
                print("")
            }
        }
        botaoPressionado = true
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        botaoPressionado = false
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = self.atPoint(location)
            switch(nodeTouched.name){
            case "botaoEsquerda":
                self.personagem.removeAllActions()
                self.personagem.run(.repeatForever(self.animacaoPE))
            case "botaoDireita":
                self.personagem.removeAllActions()
                self.personagem.run(.repeatForever(self.animacaoPD))
            default:
                print("default")
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
    }
    
}
