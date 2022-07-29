public with sharing class DummyPostResponseWrapper {
    public list<Post> posts;

    public class Post{
        public integer id;
        public string title;
        public string body;
        public integer userId;
        public List<string> tags;
    }
}

// asagidaki wrapper class DummyPostCallout da yazilan ikinci class icin gerekli.

public with sharing class DummyPostResponseWrapper {
    public list<Cls_Post> posts;

    public class Cls_Post{
        public integer id;
        public string title;
        public string body;
        public integer userId;
        public List<string> tags;
    }
}
