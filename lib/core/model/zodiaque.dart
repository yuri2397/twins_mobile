class SigneZodiaque {
  String nom;
  String description;
  String cheminImage;

  SigneZodiaque(this.nom, this.description, this.cheminImage);
}

List<SigneZodiaque> listeSignes = [
  SigneZodiaque(
      "Bélier",
      "Le Bélier est un leader, courageux, mais aussi égocentrique. Il n’a pas peur de dire ce qu’il pense. Il peut paraître nerveux et impatient mais se donnera tous les moyens pour atteindre ses objectifs.",
      "assets/images/aries.svg"),
  SigneZodiaque(
      "Taureau",
      "Stable, fiable et prudent, le Taureau est quelqu’un de doux et romantique. Il sait où il va grâce à ses choix prudents et sait ce qu’il veut. L’argent reste quelque chose d’important pour lui",
      "assets/images/taurus.svg"),
  SigneZodiaque(
      "Gémeaux",
      "Toujours de bonne humeur, le Gémeaux aime la variété et l’activité. Il change vite d’avis et à du mal à gérer ses émotions. Sa marque de fabrique : la communication !",
      "assets/images/gemini.svg"),
  SigneZodiaque(
      "Cancer",
      "Le Cancer à une humeur changeante. Très attaché au passé, il est tenace et dévoué. Il se souvient de chaque détail, ce qui fait de lui quelqu’un de sensible et possessif.",
      "assets/images/cancer.svg"),
  SigneZodiaque(
      "Lion",
      "Vaillant, autoritaire et parfois audacieux, le Lion sait être protecteur avec les gens qu’il estime. Il peut être égocentrique, mais ça ne l'empêchera pas de prendre soin des gens qui comptent pour lui.",
      "assets/images/leo.svg"),
  SigneZodiaque(
      "Vierge",
      "Réputée pour être à la fois méthodique et serviable, la Vierge est un signe exigeant envers elle-même mais également envers les autres. De nature perfectionniste, elle fera tout pour tirer le meilleur résultat possible, et ce, dans tous les domaines.",
      "assets/images/virgo.svg"),
  SigneZodiaque(
      "Balance",
      "Assoiffée de justice, la Balance est constamment à la recherche de l’équilibre parfait. Indécise, calme, aimable et attentionnée, elle sait se mettre à la place des autres et fera passer le bonheur des autres avant le sien.",
      "assets/images/libra.svg"),
  SigneZodiaque(
      "Scorpion",
      ": En plus de son côté rancunier, le Scorpion est un signe tenace et possessif. Il ne se livre jamais entièrement et se souvient des moindres détails. Il a tendance à se laisser guider par son intuition.",
      "assets/images/scorpio.svg"),
  SigneZodiaque(
      "Sagittaire",
      "Le sagittaire aime se lancer de nouveaux défis. Connu comme étant optimiste, généreux et extraverti, il aime voyager en terres inconnues pour découvrir de nouvelles cultures.",
      "assets/images/sagittarius.svg"),
  SigneZodiaque(
      "Capricorne",
      "Réservé sur ses sentiments, calme, sérieux. Le Capricorne à une volonté de fer. Il ne baisse jamais les bras et sait faire preuve de maturité dans les situations extrêmes.",
      "assets/images/capricorn.svg"),
  SigneZodiaque(
      "Verseau",
      "Curieux, original et parfois rebelle, le Verseau peut avoir tendance à se contredire. Il défend sa liberté par-dessus tout et cherche à garder son indépendance.",
      "assets/images/aquarius.svg"),
  SigneZodiaque(
      "Poissons",
      "Sensible et utopiste, le Poisson a du mal à construire son identité. Il contourne les obstacles et est doté d’un 6e sens qui lui permet de sortir des difficultés.",
      "assets/images/pisces.svg"),
];
