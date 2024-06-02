#!/bin/bash

# Kullanıcı ve grup yönetim scripti
# User and group management script

echo "Please select the language / Lütfen dili seçin:"
echo "1. English"
echo "2. Türkçe"

read -p "Your choice / Seçiminiz (1-2): " language_choice

if [ $language_choice -eq 1 ]; then
    lang="en"
elif [ $language_choice -eq 2 ]; then
    lang="tr"
else
    echo "Invalid choice / Geçersiz seçim."
    exit 1
fi

if [ $lang == "en" ]; then
    echo "Please choose the operation you want to perform:"
    echo "1. Add new user"
    echo "2. Add new group"
    echo "3. Add user to group"
    echo "4. Remove user from group"
    echo "5. Delete user"
    echo "6. Delete group"
    echo "7. Display user information"
    echo "8. Exit"

    read -p "Your choice (1-8): " choice
elif [ $lang == "tr" ]; then
    echo "Lütfen yapmak istediğiniz işlemi seçin:"
    echo "1. Yeni kullanıcı ekle"
    echo "2. Yeni grup ekle"
    echo "3. Kullanıcıyı gruba ekle"
    echo "4. Kullanıcıyı gruptan çıkar"
    echo "5. Kullanıcıyı sil"
    echo "6. Grubu sil"
    echo "7. Kullanıcı bilgilerini görüntüle"
    echo "8. Çıkış"

    read -p "Seçiminiz (1-8): " choice
fi

case $choice in
    1)
        if [ $lang == "en" ]; then
            read -p "Enter the username to add: " username
            sudo adduser $username
            if [ $? -eq 0 ]; then
                echo "User $username successfully created."
            else
                echo "Failed to create user or user already exists."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Eklemek istediğiniz kullanıcı adı: " kullanici_adi
            sudo adduser $kullanici_adi
            if [ $? -eq 0 ]; then
                echo "Kullanıcı $kullanici_adi başarıyla oluşturuldu."
            else
                echo "Kullanıcı oluşturulamadı veya zaten mevcut."
            fi
        fi
        ;;
    2)
        if [ $lang == "en" ]; then
            read -p "Enter the group name to add: " group_name
            sudo addgroup $group_name
            if [ $? -eq 0 ]; then
                echo "Group $group_name successfully created."
            else
                echo "Failed to create group or group already exists."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Eklemek istediğiniz grup adı: " grup_adi
            sudo addgroup $grup_adi
            if [ $? -eq 0 ]; then
                echo "Grup $grup_adi başarıyla oluşturuldu."
            else
                echo "Grup oluşturulamadı veya zaten mevcut."
            fi
        fi
        ;;
    3)
        if [ $lang == "en" ]; then
            read -p "Enter the username: " username
            read -p "Enter the group name: " group_name
            sudo usermod -aG $group_name $username
            if [ $? -eq 0 ]; then
                echo "User $username successfully added to group $group_name."
            else
                echo "Failed to add user to group."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Kullanıcı adı: " kullanici_adi
            read -p "Grup adı: " grup_adi
            sudo usermod -aG $grup_adi $kullanici_adi
            if [ $? -eq 0 ]; then
                echo "Kullanıcı $kullanici_adi grup $grup_adi'ya başarıyla eklendi."
            else
                echo "Kullanıcı grup eklenemedi."
            fi
        fi
        ;;
    4)
        if [ $lang == "en" ]; then
            read -p "Enter the username: " username
            read -p "Enter the group name: " group_name
            sudo deluser $username $group_name
            if [ $? -eq 0 ]; then
                echo "User $username successfully removed from group $group_name."
            else
                echo "Failed to remove user from group."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Kullanıcı adı: " kullanici_adi
            read -p "Gruptan çıkarılacak grup adı: " grup_adi
            sudo deluser $kullanici_adi $grup_adi
            if [ $? -eq 0 ]; then
                echo "Kullanıcı $kullanici_adi grup $grup_adi'dan başarıyla çıkarıldı."
            else
                echo "Kullanıcı grup çıkarma işlemi başarısız oldu."
            fi
        fi
        ;;
    5)
        if [ $lang == "en" ]; then
            read -p "Enter the username to delete: " username
            sudo deluser --remove-home $username
            if [ $? -eq 0 ]; then
                echo "User $username successfully deleted."
            else
                echo "Failed to delete user."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Silmek istediğiniz kullanıcı adı: " kullanici_adi
            sudo deluser --remove-home $kullanici_adi
            if [ $? -eq 0 ]; then
                echo "Kullanıcı $kullanici_adi başarıyla silindi."
            else
                echo "Kullanıcı silme işlemi başarısız oldu."
            fi
        fi
        ;;
    6)
        if [ $lang == "en" ]; then
            read -p "Enter the group name to delete: " group_name
            sudo delgroup $group_name
            if [ $? -eq 0 ]; then
                echo "Group $group_name successfully deleted."
            else
                echo "Failed to delete group."
            fi
        elif [ $lang == "tr" ]; then
            read -p "Silmek istediğiniz grup adı: " grup_adi
            sudo delgroup $grup_adi
            if [ $? -eq 0 ]; then
                echo "Grup $grup_adi başarıyla silindi."
            else
                echo "Grup silme işlemi başarısız oldu."
            fi
        fi
        ;;
    7)
        if [ $lang == "en" ]; then
            read -p "Enter the username to display information: " username
            id $username
        elif [ $lang == "tr" ]; then
            read -p "Bilgilerini görüntülemek istediğiniz kullanıcı adı: " kullanici_adi
            id $kullanici_adi
        fi
        ;;
    8)
        if [ $lang == "en" ]; then
            echo "Exiting..."
        elif [ $lang == "tr" ]; then
            echo "Çıkış yapılıyor..."
        fi
        exit 0
        ;;
    *)
        if [ $lang == "en" ]; then
            echo "Invalid choice. Please select between 1 and 8."
        elif [ $lang == "tr" ]; then
            echo "Geçersiz seçenek. Lütfen 1 ile 8 arasında bir seçim yapın."
        fi
        ;;
esac

if [ $lang == "en" ]; then
    echo "Operation completed."
elif [ $lang == "tr" ]; then
    echo "İşlem tamamlandı."
fi
