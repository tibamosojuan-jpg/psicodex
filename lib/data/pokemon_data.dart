import '../models/pokemon_profile.dart';
import '../models/trait.dart';

Map<Trait, int> _p(int ex, int ap, int re, int am, int es) =>
    {Trait.ex: ex, Trait.ap: ap, Trait.re: re, Trait.am: am, Trait.es: es};

// los 16 pokemon con sus perfiles
final List<PokemonProfile> pokemonList = [
  PokemonProfile(
    id: 25, name: 'Pikachu', title: 'El amigo con chispa',
    explanation: 'Contagias energía y buena onda. Te encanta estar con gente y siempre tienes una palabra amable para todos.',
    funFact: 'Guarda electricidad en las bolsas de sus mejillas.',
    profile: _p(90, 50, 45, 90, 65),
  ),
  PokemonProfile(
    id: 143, name: 'Snorlax', title: 'El maestro de la calma',
    explanation: 'Nada te altera. Vives a tu ritmo, disfrutas lo simple y tu calma tranquiliza a quienes te rodean.',
    funFact: 'Solo se despierta para comer, y come cientos de kilos al día.',
    profile: _p(15, 15, 5, 60, 80),
  ),
  PokemonProfile(
    id: 94, name: 'Gengar', title: 'El bromista creativo',
    explanation: 'Eres ingenioso, travieso y lleno de ideas. Te gusta romper la rutina y sacar risas, aunque los planes no sean lo tuyo.',
    funFact: 'Se esconde en las sombras y hace bajar la temperatura a su alrededor.',
    profile: _p(75, 75, 10, 30, 60),
  ),
  PokemonProfile(
    id: 54, name: 'Psyduck', title: 'El corazón sensible',
    explanation: 'Sientes todo con intensidad y te preocupas por los demás. Tu sensibilidad también es tu forma de cuidar.',
    funFact: 'Siempre tiene dolor de cabeza; cuando empeora, libera poderes psíquicos.',
    profile: _p(35, 15, 20, 75, 5),
  ),
  PokemonProfile(
    id: 133, name: 'Eevee', title: 'El explorador de mil caminos',
    explanation: 'Quieres probarlo todo. Te adaptas, cambias de rumbo y cada experiencia nueva te emociona.',
    funFact: 'Puede evolucionar de ocho formas distintas.',
    profile: _p(70, 90, 25, 50, 45),
  ),
  PokemonProfile(
    id: 6, name: 'Charizard', title: 'El aventurero apasionado',
    explanation: 'Vas con todo detrás de lo que te apasiona. Eres intenso, creativo y no le temes a los retos.',
    funFact: 'La llama de su cola arde con más fuerza después de combates duros.',
    profile: _p(70, 75, 50, 20, 20),
  ),
  PokemonProfile(
    id: 181, name: 'Ampharos', title: 'El faro de confianza',
    explanation: 'Eres la persona a la que todos acuden. Cumples, cuidas a los demás y das seguridad sin hacer ruido.',
    funFact: 'La luz de su cola se ve desde muy lejos; antes se usaba como faro.',
    profile: _p(70, 40, 75, 90, 60),
  ),
  PokemonProfile(
    id: 282, name: 'Gardevoir', title: 'El protector empático',
    explanation: 'Te pones en el lugar de los demás y los proteges. Eres reservado, pero tu empatía se nota en cada gesto.',
    funFact: 'Para proteger a su entrenador es capaz de crear un pequeño agujero negro.',
    profile: _p(30, 60, 55, 95, 45),
  ),
  PokemonProfile(
    id: 359, name: 'Absol', title: 'El guardián incomprendido',
    explanation: 'Eres responsable y ves venir los problemas antes que nadie. No siempre te entienden, pero siempre cuidas.',
    funFact: 'Aparece antes de los desastres para advertir, y por eso lo culpaban de ellos.',
    profile: _p(20, 45, 85, 55, 30),
  ),
  PokemonProfile(
    id: 257, name: 'Blaziken', title: 'El líder determinado',
    explanation: 'Te gusta liderar y llegar a la meta. Eres directo, disciplinado y mantienes la cabeza fría bajo presión.',
    funFact: 'Puede saltar por encima de un edificio de 30 pisos.',
    profile: _p(80, 25, 80, 30, 60),
  ),
  PokemonProfile(
    id: 448, name: 'Lucario', title: 'El disciplinado leal',
    explanation: 'Eres constante, sereno y de principios firmes. Hablas poco, pero tu lealtad no tiene precio.',
    funFact: 'Percibe el aura de los seres vivos, incluso sus emociones.',
    profile: _p(25, 55, 80, 65, 70),
  ),
  PokemonProfile(
    id: 571, name: 'Zoroark', title: 'El ilusionista independiente',
    explanation: 'Tienes un mundo interior lleno de ideas y prefieres seguir tu propio camino, sin depender de nadie.',
    funFact: 'Crea ilusiones para proteger a su manada.',
    profile: _p(40, 80, 60, 15, 40),
  ),
  PokemonProfile(
    id: 658, name: 'Greninja', title: 'El estratega sereno',
    explanation: 'Piensas antes de actuar, planeas con calma y encuentras soluciones creativas sin perder la serenidad.',
    funFact: 'Lanza estrellas de agua tan afiladas que cortan el metal.',
    profile: _p(50, 80, 75, 25, 80),
  ),
  PokemonProfile(
    id: 778, name: 'Mimikyu', title: 'El alma tímida que busca cariño',
    explanation: 'Eres reservado y muy imaginativo. Te cuesta abrirte, pero cuando confías das un cariño enorme.',
    funFact: 'Se disfraza de Pikachu con la esperanza de hacer amigos.',
    profile: _p(20, 70, 45, 60, 10),
  ),
  PokemonProfile(
    id: 823, name: 'Corviknight', title: 'El confiable de acero',
    explanation: 'Callado, metódico y cumplidor. Los demás saben que pueden contar contigo, pase lo que pase.',
    funFact: 'En la región de Galar funciona como taxi aéreo.',
    profile: _p(35, 20, 80, 35, 75),
  ),
  PokemonProfile(
    id: 959, name: 'Tinkaton', title: 'El directo de armas tomar',
    explanation: 'Dices las cosas como son y no te dejas intimidar. Tienes energía de sobra y vas de frente.',
    funFact: 'Con su martillo es capaz de derribar a un Corviknight en pleno vuelo.',
    profile: _p(75, 15, 45, 5, 55),
  ),
];

PokemonProfile pokemonById(int id) =>
    pokemonList.firstWhere((p) => p.id == id, orElse: () => pokemonList.first);
