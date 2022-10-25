protocol AdvancedLifeSupport {
    func perfomCPR()
    
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happend?")
    }
    func medicalEmergency(){
        delegate?.perfomCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler:EmergencyCallHandler) {
        handler.delegate = self
    }
    func perfomCPR() {
        print("The paramedic does chest compression,30 per second")
        
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler:EmergencyCallHandler) {
        handler.delegate = self
    }
    func perfomCPR() {
        print("The doctor does chest compression,30 per second")
    }
    
    func useStethescope(){
        print("Listing for the heart sounds")
    }
}
class Surgeon:Doctor {
    override func perfomCPR() {
        super.perfomCPR()
        print("Sings staying alive by the BeeGees")
    }
    func useElectricDrill(){
        print("Whirr...")
    }
}
let emilio = EmergencyCallHandler()
let peta = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
