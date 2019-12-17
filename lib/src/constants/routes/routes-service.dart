class RouteService{
    static const String programs='https://congreso-spo.firebaseio.com/programs.json';
    static const String sponsors='https://congreso-spo.firebaseio.com/sponsors.json';
    static const String comites='https://congreso-spo.firebaseio.com/comites.json';
    static const String countries='https://congreso-spo.firebaseio.com/countries.json';
    static const String speakers='https://congreso-spo.firebaseio.com/speakers.json';
    static const String tourism='https://congreso-spo.firebaseio.com/tourism.json';
    static const String notifications='https://congreso-spo.firebaseio.com/notifications.json';
    static speaker(id) => 'https://congreso-spo.firebaseio.com/speakers/$id.json';
}
