/* ContentView.swift --> SpeechRecognition. Created by Miguel Torres on 28/04/23. */

import SwiftUI

// Creamos la estructura ContentView que se ajusta al protocolo View.
struct ContentView: View {
    // Definimos una variable de estado para almacenar y actualizar el estado de la grabación.
    @State private var recordingStatus = "Presione el botón para iniciar la grabación"
    // Definimos una variable de estado para almacenar y actualizar el título del botón de grabación.
    @State private var recordButtonTitle = "Iniciar grabación"
    // Definimos una variable de estado para crear un objeto de SpeechManager y mantenerlo actualizado.
    @StateObject private var speechManager = SpeechManager()
    
    // Definimos el cuerpo de nuestra vista utilizando la vista de la columna VStack.
    var body: some View {
        VStack {
            // Mostramos el texto del estado de la grabación y aplicamos un relleno alrededor.
            Text(recordingStatus)
                .padding()
            
            // Creamos un botón que llame a la función recordButtonTapped() de SpeechManager.
            Button{
                speechManager.recordButtonTapped()
                // Comprobamos si el motor de audio está en funcionamiento.
                if speechManager.audioEngine.isRunning {
                    // Si está funcionando, actualizamos el título del botón y el estado de la grabación.
                    recordButtonTitle = "Detener grabación"
                    recordingStatus = "Grabando..."
                } else {
                    // Si no está funcionando, actualizamos el título del botón y el estado de la grabación.
                    recordButtonTitle = "Iniciar grabación"
                    recordingStatus = "Audio analizado."
                }
            } label: {
                // Mostramos el título del botón de grabación y aplicamos un relleno alrededor.
                Text(recordButtonTitle)
                    .padding()
            }
        }
        // Cuando aparece la vista, llamamos a la función requestAuthorization() de SpeechManager para solicitar autorización.
        .onAppear(perform: {
            speechManager.requestAuthorization()
        })
    }
}

// Generamos vistas previas de ContentView.
struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
