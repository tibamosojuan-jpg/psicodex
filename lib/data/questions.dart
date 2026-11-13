import '../models/question.dart';
import '../models/trait.dart';

// las 15 preguntas, 3 por cada rasgo
const List<Question> questions = [
  Question(Trait.ex, 'Llegas a un pueblo nuevo y el Centro Pokémon está lleno.', [
    'Me presento a todos y armo plan.',
    'Converso con quien se acerque.',
    'Saludo a una o dos personas.',
    'Busco un rincón tranquilo.',
  ]),
  Question(Trait.ap, 'Encuentras un camino que no aparece en el mapa.', [
    'Lo tomo de una.',
    'Lo exploro un poco.',
    'Lo anoto para volver después.',
    'Sigo la ruta conocida.',
  ]),
  Question(Trait.re, 'Mañana es tu combate de gimnasio.', [
    'Tengo estrategia y plan B desde hace días.',
    'Repaso lo importante esta noche.',
    'Le doy una mirada rápida en la mañana.',
    'Improviso en el momento.',
  ]),
  Question(Trait.am, 'Un entrenador novato pierde contra ti y queda triste.', [
    'Lo acompaño y lo animo.',
    'Le digo algo amable.',
    'Le doy la mano.',
    'Le digo con franqueza qué hizo mal.',
  ]),
  Question(Trait.es, 'Tu Pokémon favorito queda debilitado en un combate importante.', [
    'Respiro y cambio de estrategia.',
    'Me afecta, pero me recupero.',
    'Los nervios me ganan.',
    'Siento que todo se derrumba.',
  ]),
  Question(Trait.ex, 'Tienes un día libre tras una semana intensa.', [
    'Salida con un grupo grande.',
    'Me uno al plan que haya.',
    'Veo a una persona de confianza.',
    'Recargo energía a solas.',
  ]),
  Question(Trait.ap, 'Una profesora Pokémon te invita a investigar con ella.', [
    'Una teoría extraña que nadie ha probado.',
    'Un tema poco conocido.',
    'Mejorar un método que ya funciona.',
    'Algo práctico y rápido.',
  ]),
  Question(Trait.re, 'Tu mochila de viaje está…', [
    'Perfectamente organizada.',
    'Más o menos en orden.',
    'Algo caótica.',
    'Llevo lo que cabe en los bolsillos.',
  ]),
  Question(Trait.am, 'Tu equipo no se pone de acuerdo con la ruta.', [
    'Cedo para que todos estén bien.',
    'Busco una opción que sirva para todos.',
    'Defiendo mi idea, pero escucho.',
    'Defiendo mi idea hasta el final.',
  ]),
  Question(Trait.es, 'La noche antes de un viaje largo…', [
    'Duermo tranquilo.',
    'Pienso un rato y me duermo.',
    'Le doy vueltas a lo que podría salir mal.',
    'Casi no duermo.',
  ]),
  Question(Trait.ex, 'En un combate por equipos, tu papel natural es…', [
    'Hablar por el equipo y animar.',
    'Participar y proponer.',
    'Escuchar y aportar.',
    'Concentrarme en mi parte.',
  ]),
  Question(Trait.ap, 'Para decorar tu base secreta…', [
    'Invento un estilo propio.',
    'Mezclo ideas con mi toque.',
    'Algo bonito que ya funciona.',
    'Lo funcional y ya.',
  ]),
  Question(Trait.re, 'Te propones registrar todos los Pokémon de la región.', [
    'Hago lista, ruta y no paro.',
    'Soy constante, con pausas.',
    'Empiezo con todo y pierdo ritmo.',
    'Registro los que me encuentre.',
  ]),
  Question(Trait.am, 'Un desconocido te pide prestada una Poción.', [
    'Se la doy sin pensarlo.',
    'Se la doy si de verdad la necesita.',
    'Le pregunto para qué la quiere.',
    'Desconfío; primero lo mío.',
  ]),
  Question(Trait.es, 'Alguien critica tu forma de entrenar delante de otros.', [
    'Tomo lo útil y sigo.',
    'Me incomoda, pero lo supero.',
    'Me quedo pensando en eso por días.',
    'Me duele y dudo de mí.',
  ]),
];
