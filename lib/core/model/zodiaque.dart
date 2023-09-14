class SigneZodiaque {
  String nom;
  String description;
  String cheminImage;

  SigneZodiaque(this.nom, this.description, this.cheminImage);
}

List<SigneZodiaque> listeSignes = [
  SigneZodiaque(
      "Bélier",
      "Le Bélier est un leader, courageux, mais aussi égocentrique. "
          "Il n'a pas peur de dire ce qu'il pense. "
          "Il peut paraître nerveux et impatient mais se donnera tous les moyens pour atteindre ses objectifs.",
      "assets/images/aries.svg"),
  SigneZodiaque(
      "Taureau",
      "Stable, fiable et prudent, le Taureau est quelqu'un de doux et romantique. "
          "Il sait où il va grâce à ses choix prudents et sait ce qu'il veut. "
          "L'argent reste quelque chose d'important pour lui.",
      "assets/images/taurus.svg"),
  SigneZodiaque(
      "Gémeaux",
      "Toujours de bonne humeur, le Gémeaux aime la variété et l'activité. "
          "Il change vite d'avis et a du mal à gérer ses émotions. Sa marque de fabrique : la communication !",
      "assets/images/gemini.svg"),
  SigneZodiaque(
      "Cancer",
      "Le Cancer a une humeur changeante. Très attaché au passé, il est tenace et dévoué. "
          "Il se souvient de chaque détail, ce qui fait de lui quelqu'un de sensible et possessif.",
      "assets/images/cancer.svg"),
  SigneZodiaque(
      "Lion",
      "Vaillant, autoritaire et parfois audacieux, le Lion sait être protecteur avec les gens qu'il estime. "
          "Il peut être égocentrique, mais ça ne l'empêchera pas de prendre soin des gens qui comptent pour lui.",
      "assets/images/leo.svg"),
  SigneZodiaque(
      "Vierge",
      "La Vierge est une personne méthodique, fiable et modeste. "
          "Elle a un sens aigu du devoir et est prête à aider les autres. "
          "Elle peut être un peu critique mais c'est parce qu'elle vise toujours la perfection.",
      "assets/images/virgo.svg"),
  SigneZodiaque(
      "Balance",
      "La Balance est diplomate, charmante et sociable. "
          "Elle a un grand sens de la justice et cherche toujours l'harmonie. "
          "Elle peut parfois avoir du mal à prendre des décisions.",
      "assets/images/libra.svg"),
  SigneZodiaque(
      "Scorpion",
      "Le Scorpion est intense, passionné et déterminé. "
          "Il a un grand sens de la loyauté et de la fidélité envers ceux qu'il aime. "
          "Il peut parfois être un peu jaloux.",
      "assets/images/scorpio.svg"),
  SigneZodiaque(
      "Sagittaire",
      "Le Sagittaire est aventureux, optimiste et honnête. "
          "Il aime la liberté et a soif de nouvelles expériences. "
          "Il peut être un peu trop direct dans sa communication.",
      "assets/images/sagittarius.svg"),
  SigneZodiaque(
      "Capricorne",
      "Le Capricorne est responsable, ambitieux et déterminé. "
          "Il est discipliné et sait comment atteindre ses objectifs. "
          "Il peut sembler un peu distant mais c'est parce qu'il se concentre sur son succès.",
      "assets/images/capricorn.svg"),
  SigneZodiaque(
      "Verseau",
      "Le Verseau est original, créatif et humanitaire. "
          "Il a un esprit libre et cherche toujours à faire progresser la société. "
          "Il peut parfois sembler un peu excentrique.",
      "assets/images/aquarius.svg"),
  SigneZodiaque(
      "Poissons",
      "Les Poissons sont empathiques, intuitifs et sensibles. "
          "Ils ont une grande compassion pour les autres et sont très créatifs. "
          "Ils peuvent être un peu rêveurs.",
      "assets/images/pisces.svg"),
];
