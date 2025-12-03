import 'package:googleapis_auth/auth_io.dart';
import 'dart:async';
import 'dart:convert';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    const serviceAccountJson = {
      "type": "service_account",
      "project_id": "to-do-list-2c800",
      "private_key_id": "8c83723b7bd32c18fa4c5ba0d67dc1021b93075e",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDMS+sSWq/4xtGE\nDThxACLF3uqxHnvjE8EoUjkUXt0egBZ2pID8iPAWetkaQxufLTFf/xovtJY33l/g\nw7+sM9GHnY/N+8mDa9dxBLb1iriaNCT789vlr1GVXJokiCyebI+7eNsltiUyYHJ9\nKkPcYDEcnnxSiweQUu4hS3RU29y9IdTCaiHbrk2GPcrI3fo5Vm3okAYNBMzBA1Vn\nddA9aDo3l/+dqB2BYiWhI5WiUHij46E1p3tcNR/J6ELEPgev6QUkQzDNY5BndwxP\nhkd1oBdpwVZbyc/hFwoL1U61gbfLG2bW7wz9LB8LcEIFknTmRXvqWf3BKU4hJYxl\nW2w4U4rjAgMBAAECggEAQrujyEWOSL2tD6z/3E2WjjsAP6X9AtJfnIurMH/CS+W8\nMLoQli0m+7jaNO1p1ud8wuZCCAY9sXc2q2VVtWrhzSJHKJpQG1k9MSJAn1lWbqyM\nzi48jLzlcdwjT76ZkJBWrP7P2vQyF1AQ5djJ/PEA6d/NLWtTp62nMoICuHtvEeom\n/uy2xJOAwKrU8sUwsUJrlvcy5OowfvE8proySAJ2bsJ0ziXRa4QJCpy84xBYQXTK\nUlycAI26dotpPBN6eYQ5dby5IPvW/lOGbvBddgqbh8JepIxtCto68IbaiGsrwMhR\nWBgw4A5ddkOnhrJiwnMsRvghtB1p1ZqNHjMk0dtb9QKBgQDyHNzA0/ZQ47l6nQ29\n7n7RjwooEdNulmC3oDs0wHkCji0DB7VcpnmcnvrVOCSfuo0g2uMcTeyYRqO+YlW5\npt8sVFuwHMgOi1LElhz3RfTCDNQfxYEsCyG3dPm2WCONnyUeVRjKIf8ZzkjIRZuN\nrtlpO5DMA8pgZnbFG6waRk6hhQKBgQDYA8UrM6mlD62m7aVY2YRQ7eTFVutALFk1\nWgnSp9/Nv9RPSfmTJukgXtVp0fYvn9jKhNZvpvKjQ9d3A1mAr259Q82dQxYqRLlS\nJwZUHBSe3G89BYtLj7MEAF0M5v0q+r8NPgUyxmzUlaCRsUG0I1a6/vNHqBVa4rJt\n2o7b1P5zRwKBgQC+JDamZZDDdCS9i8w4Bq6oS0rxrxY6enUYoQj+Y85lWF03TP18\n9uz5OM3LWB1DKFIfpGfKWdRevtNn+HhUph4NBW9Af0oKShbFdxLmi5UuNL7++LB6\nc3+WQZK/RrcdSQfwq2odjNd4X84/IpOIkPIDuBj+cFemn7HVGOdvdxnXtQKBgBcr\nCFmi194ZOWG++U33PmbDrRaxRNgEKak8N/N9B9b0bRv37imnMbfEFBWebE4dUc4e\nwzUEbd+u5gwgstfHeQ08WXA1gsoTxuCVyOr6fAex0shzsMXw6p1SQKiimaKjdBxC\ne6I/f+qpBai6nzZn1+SEdalI0MmHqOV5XHsddBD/AoGBANl++44GzqIu5jYEU4bb\nMS8po7jnOcGEa9BAkSL0VWtwutuJSDuEj1rCgEc9MVcwXPolR0kEBfYQVAVtihAn\nu4/kK0xmFlWuqpvwXgLp6uo2/igv1B/zBWXEEhzwpw8mNMzMpbSYNHHL66jiRQgd\n9QLgBypS70h/wgVVduBwY9Ko\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@to-do-list-2c800.iam.gserviceaccount.com",
      "client_id": "102167218337654202188",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40to-do-list-2c800.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    try {
      final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      final accessServerKey = client.credentials.accessToken.data;
      client.close();

      return accessServerKey;
    } catch (e) {
      print("Error generating token: $e");
      return "ERROR: Token generation failed.";
    }
  }
}
