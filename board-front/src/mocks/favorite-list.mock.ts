// favorite-list.mock.ts
import { FavoriteListItem } from 'types/interface';

const favoriteListMock: FavoriteListItem[] = [
    {
        nickname: "맛집탐험자",
        profileImage: null,
        email: "foodlover@example.com",
    },
    {
        nickname: "영화매니아",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        email: "moviefan@example.com",
    },
    {
        nickname: "여행러",
        profileImage: null,  // 프로필 이미지가 없는 경우 기본 이미지를 사용
        email: "traveler@example.com",
    },
    {
        nickname: "스포츠광",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        email: "sportslover@example.com",
    },
    {
        nickname: "캠핑러",
        profileImage: null,
        email: "camper@example.com",
    },
    {
        nickname: "책사랑",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        email: "bookworm@example.com",
    },
    {
        nickname: "음악팬",
        profileImage: null,
        email: "musicfan@example.com",
    },
    {
        nickname: "사진작가",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        email: "photographer@example.com",
    },
    {
        nickname: "커피홀릭",
        profileImage: null,
        email: "coffeeholic@example.com",
    },
    {
        nickname: "맛집연구원",
        profileImage: "https://media.bunjang.co.kr/product/250100237_1_1705586378_w50.jpg",
        email: "gourmetresearcher@example.com",
    }
];

export default favoriteListMock;
